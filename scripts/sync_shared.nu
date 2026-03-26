#!/usr/bin/env nu

# Sync shared content (legal docs, acknowledgements) to Zola website pages.
# Usage: nu scripts/sync_shared.nu
# Run from website/ root

const SHARED_DIR = "../shared"
const CONTENT_DIR = "content/docs"
const GENERATED_COMMENT = "<!-- Generated from shared/ -- do not edit by hand -->"

def sync-privacy-policy [] {
    let source = (open --raw $"($SHARED_DIR)/legal/privacy-policy.md")
    let snippet = (open --raw "scripts/_privacy-policy-extra.md" | str trim --right)

    let frontmatter = [
        "+++"
        'title = "Privacy Policy"'
        "weight = 31"
        ""
        "[extra]"
        'sidebar_group = "Legal"'
        "+++"
    ] | str join "\n"

    # Insert snippet before the Third-Party Services Summary section
    let marker = "---\n\n## Third-Party Services Summary"
    let body = ($source | str replace $marker $"($snippet)\n\n($marker)")

    $"($frontmatter)\n($GENERATED_COMMENT)\n($body)" | save -f $"($CONTENT_DIR)/privacy-policy.md"
    print "Synced privacy-policy.md"
}

def sync-terms-of-service [] {
    let source = (open --raw $"($SHARED_DIR)/legal/terms-of-service.md")

    let frontmatter = [
        "+++"
        'title = "Terms of Service"'
        "weight = 32"
        ""
        "[extra]"
        'sidebar_group = "Legal"'
        "+++"
    ] | str join "\n"

    $"($frontmatter)\n($GENERATED_COMMENT)\n($source)" | save -f $"($CONTENT_DIR)/terms-of-service.md"
    print "Synced terms-of-service.md"
}

def sync-acknowledgements [] {
    let data = (open $"($SHARED_DIR)/acknowledgements.toml")
    let deps = ($data | get dependencies)

    let frontmatter = [
        "+++"
        'title = "Acknowledgements"'
        "weight = 24"
        ""
        "[extra]"
        'sidebar_group = "About"'
        "+++"
    ] | str join "\n"

    # Build markdown table from TOML entries
    let lp = "("
    let rp = ")"
    mut rows = [
        "| Project | License | Used for |"
        "|---------|---------|----------|"
    ]
    for dep in $deps {
        $rows = ($rows | append $"| [($dep.name)]($lp)($dep.url)($rp) | ($dep.license) | ($dep.description) |")
    }
    let table = ($rows | str join "\n")

    let body = [
        "# Acknowledgements"
        ""
        "Cache is built on the shoulders of incredible open source projects. I'm grateful to the communities behind them."
        ""
        "## Open Source"
        ""
        $table
        ""
        "## Founders"
        ""
        "Thank you to the founders whose early support helped fund the development of Cache."
        ""
        '{{ founders_badges() }}'
    ] | str join "\n"

    $"($frontmatter)\n($GENERATED_COMMENT)\n($body)\n" | save -f $"($CONTENT_DIR)/acknowledgements.md"
    print "Synced acknowledgements.md"
}

def main [] {
    sync-privacy-policy
    sync-terms-of-service
    sync-acknowledgements
    print "Done — all shared content synced"
}
