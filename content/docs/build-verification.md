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
| Android APK | APK signing certificate | [`E0:FB:26:D7:...`](#certificate-fingerprint-sha-256) |
| Linux | Minisign (Ed25519) | [`RWSu...H8RQ`](#public-key) |

Downloads from Google Play, Apple App Store, and Microsoft Store are verified by each platform's own trust chain — no additional steps needed.

---

## Android APK

Verify the signing certificate fingerprint to confirm the APK is an authentic Cache build.

**Package IDs:**

- `io.rocketware.cache` (Direct/Accrescent)
- `io.rocketware.cache.googleplay` (Google Play)

### Certificate fingerprint (SHA-256)

```
E0:FB:26:D7:60:32:37:72:B2:47:B4:D3:5D:34:2F:B0:EF:40:9B:17:22:7C:DB:CA:A8:43:D3:9A:24:FA:43:1E
```

### Verification steps

**On device (Android):**

Install [AppVerifier](https://github.com/soupslurpr/AppVerifier) and compare the certificate fingerprint against the value above.

**On desktop (apksigner):**

<pre><code>apksigner verify --print-certs cache.apk</code></pre>

Compare the `Signer #1 certificate SHA-256 digest` against the fingerprint above.

---

## Linux

Linux direct downloads (AppImage, deb, rpm, tar.gz) are signed using [Minisign](https://jedisct1.github.io/minisign/).

Each release includes a **signed manifest** (e.g. <code>v{{ latest_version() }}.manifest.toml</code>) listing every artifact with its SHA-256 checksum. Verifying the manifest signature proves both integrity and authenticity of all listed artifacts.

### Public key

```
RWSuyCCt9+/8XP0AK3jidFQotJmj82u3RQvmTRCHZeW460xcSsjxH8RQ
```

Download: [`cache-minisign.pub`](/cache-minisign.pub) (also available on [Github](https://github.com/rocketware/cache/blob/main/cache-minisign.pub)).

### Verification steps

**1. Install Minisign**

Install [Minisign](https://jedisct1.github.io/minisign/) for your platform.

**2. Download the manifest and signature**

From any release page, download the `.manifest.toml` manifest and its `.manifest.toml.minisig` signature. Available from three independent sources:

- **Website**: <code>https://www.cachenotes.app/releases/v{{ latest_version() }}.manifest.toml</code>
- **GitHub**: release assets on [github.com/rocketware/cache/releases](https://github.com/rocketware/cache/releases)
- **GCP mirror**: <code>https://download.rocketware.io/cache/v{{ latest_version() }}/</code>

**3. Verify the signature**

<pre><code>minisign -Vm v{{ latest_version() }}.manifest.toml -p cache-minisign.pub</code></pre>

If valid, you'll see: `Signature and comment signature verified`.

**4. Compare SHA-256**

Compare the checksum of your downloaded artifact:

<pre><code>sha256sum cache-{{ latest_version() }}-linux-x64.AppImage</code></pre>

Match the output against the `sha256` field in the manifest for that artifact.

---

## App stores

Downloads from Google Play, Apple App Store, and Microsoft Store are signed through each platform's trust chain. The platform verifies integrity before installation — no additional verification is required.
