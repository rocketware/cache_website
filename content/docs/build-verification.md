+++
title = "Build Verification"
weight = 24

[extra]
sidebar_group = "About"
+++

# Build Verification

All Cache direct downloads are cryptographically signed using [Minisign](https://jedisct1.github.io/minisign/), a simple and lightweight tool for verifying file integrity and authenticity.

## What is signed

Each release includes a **signed manifest** (e.g. <code>v{{ latest_version() }}.toml</code>) listing every artifact with its SHA-256 checksum. The manifest is signed with our Ed25519 key — verifying the signature proves both integrity and authenticity of all listed artifacts.

## Public key

```
RWSuyCCt9+/8XP0AK3jidFQotJmj82u3RQvmTRCHZeW460xcSsjxH8RQ
```

Download: [`cache-minisign.pub`](/cache-minisign.pub)

The public key is also available in the [repository root](https://github.com/rocketware/cache/blob/main/cache-minisign.pub).

---

## Verification steps

### 1. Install minisign

Install [Minisign](https://jedisct1.github.io/minisign/) for your platform.

### 2. Download the manifest and signature

From any release page, download the `.toml` manifest and its `.toml.minisig` signature. These are available from three independent sources:

- **Website**: <code>https://www.cachenotes.app/releases/v{{ latest_version() }}.toml</code>
- **GitHub**: release assets on [github.com/rocketware/cache/releases](https://github.com/rocketware/cache/releases)
- **GCP mirror**: <code>https://download.rocketware.io/cache/v{{ latest_version() }}/</code>

### 3. Verify the signature

<pre><code>minisign -Vm v{{ latest_version() }}.toml -p cache-minisign.pub</code></pre>

If valid, you'll see: `Signature and comment signature verified`.

### 4. Compare SHA-256

After verifying the manifest, compare the checksum of your downloaded artifact:

<pre><code>sha256sum cache-{{ latest_version() }}-linux-x64.AppImage</code></pre>

Match the output against the `sha256` field in the manifest for that artifact.

---

## Platform app stores

Downloads from the Apple App Store, Google Play, and Microsoft Store are signed through each platform's own trust chain. Minisign verification applies to direct downloads (AppImage, deb, rpm, tar.gz) distributed outside of app stores.
