#!/usr/bin/env nu

# Fetch founders list from API and write to data/founders.toml
# Usage: nu scripts/fetch_founders.nu [--api-url https://...]
# Run from website/ root

const FOUNDERS_TOML = "data/founders.toml"
const DEFAULT_API_URL = "https://api.cachenotes.app/founders"

def main [
    --api-url: string  # Override API endpoint
] {
    let url = if ($api_url | is-empty) { $DEFAULT_API_URL } else { $api_url }

    print $"Fetching founders from ($url)..."

    let response = try {
        http get $url
    } catch {|e|
        print $"Warning: Failed to fetch founders list: ($e.msg)"
        print "Preserving existing founders.toml"
        return
    }

    let founders = ($response | get data.founders | default [])

    if ($founders | is-empty) {
        print "No founders returned, writing empty file"
        "# Cache Founders — fetched from API at build time\n" | save -f $FOUNDERS_TOML
        return
    }

    let sorted = ($founders | sort-by date)

    # Build TOML manually for readability
    mut lines = ["# Cache Founders — fetched from API at build time" ""]

    for f in $sorted {
        $lines = ($lines | append [
            "[[founders]]"
            $"display_name = \"($f.display_name)\""
            $"date = \"($f.date)\""
            ""
        ])
    }

    $lines | str join "\n" | save -f $FOUNDERS_TOML
    print $"Wrote ($sorted | length) founders to ($FOUNDERS_TOML)"
}
