+++
title = "Build Verification"
weight = 24

[extra]
sidebar_group = "About"
+++

# Build Verification

Cache direct downloads are cryptographically signed so you can verify integrity and authenticity before installation.

## Quick reference

| Platform | Method | Key / Fingerprint |
|---|---|---|
| All direct downloads | [Signed manifest](#signed-manifest) | [`RWSu...H8RQ`](#public-key) |
| Android APK | [APK signing certificate](#android-apk) | [`E0:FB:26:D7:...`](#certificate-fingerprint-sha-256) |
| macOS DMG | [Code signature](#macos) | Team ID [`U4KM65Y22D`](#macos) |
| App stores | Platform trust chain | No action needed |

---

## Signed manifest

Every release includes a signed manifest (e.g. <code>v{{ latest_version() }}.manifest.toml</code>) listing all artifacts with SHA-256 checksums. Verifying the manifest signature proves both integrity and authenticity.

### Public key

```
RWSuyCCt9+/8XP0AK3jidFQotJmj82u3RQvmTRCHZeW460xcSsjxH8RQ
```

Download: [`cache-minisign.pub`](/cache-minisign.pub) (also on [GitHub](https://github.com/rocketware/cache/blob/main/cache-minisign.pub)).

### Verification steps

**1. Install [Minisign](https://jedisct1.github.io/minisign/)**

**2. Download the manifest and signature**

From any release page, download `.manifest.toml` and `.manifest.toml.minisig`. Available from three independent sources:

- **Website**: <code>https://www.cachenotes.app/downloads/releases/v{{ latest_version() }}.manifest.toml</code>
- **GitHub**: release assets on [github.com/rocketware/cache/releases](https://github.com/rocketware/cache/releases)
- **GCP mirror**: <code>https://download.rocketware.io/cache/v{{ latest_version() }}/</code>

**3. Verify the signature**

<pre><code>minisign -Vm v{{ latest_version() }}.manifest.toml -p cache-minisign.pub</code></pre>

If valid, you'll see: `Signature and comment signature verified`.

**4. Compare SHA-256 checksum**

<pre><code>shasum -a 256 your-downloaded-file</code></pre>

Match the output against the `checksum_sha256` field in the manifest for that artifact.

---

## Android APK

Verify the signing certificate fingerprint to confirm the APK is an authentic Cache build.

**Package IDs:** `io.rocketware.cache` (Direct/Accrescent), `io.rocketware.cache.googleplay` (Google Play)

### Certificate fingerprint (SHA-256)

```
E0:FB:26:D7:60:32:37:72:B2:47:B4:D3:5D:34:2F:B0:EF:40:9B:17:22:7C:DB:CA:A8:43:D3:9A:24:FA:43:1E
```

**On device:** Install [AppVerifier](https://github.com/soupslurpr/AppVerifier) and compare against the fingerprint above.

**On desktop:** <pre><code>apksigner verify --print-certs cache.apk</code></pre> Compare the `Signer #1 certificate SHA-256 digest` against the fingerprint above.

---

## macOS

The DMG is code-signed with a Developer ID Application certificate. After mounting, verify:

<pre><code>codesign --verify --deep /Volumes/Cache/Cache.app
codesign -dv /Volumes/Cache/Cache.app 2>&1 | grep TeamIdentifier</code></pre>

**Expected Team ID:** `U4KM65Y22D` (Rocketware Limited)

Verify the DMG checksum against the [signed manifest](#signed-manifest).

---

## Linux

Linux direct downloads are verified via the [signed manifest](#signed-manifest). Download your artifact, then follow the manifest verification steps to confirm the SHA-256 checksum.
