+++
title = "Privacy Policy"
weight = 31

[extra]
sidebar_group = "Legal"
+++

# Privacy Policy

*Last updated: January 2025*

**Your notes never touch our servers. The *only* information the app collects is if you choose to upgrade the app sends a non-identifiable identifier which enables us to provide you with a license key.**

---

## The App

### Your Notes
- Stored locally on your device(s)
- Rocketware (the developer of Cache) has no access to your data (it never touches our servers)
- Synced to your chosen git provider via an encrypted connection (HTTPS/TLS). Refer to your git provider's privacy policy as they are the custodians of your synced data. Self-hosted git providers are also supported allowing you to retain full control over your data.

### Tracking
- There is no tracking in the App (and there never will be)
- The app uses no third-party services (as we can't guarantee their privacy practices)

### Upgrading / Licensing

To facilitate upgrades, Cache uses an accountless privacy-first licensing system:
- Your license is tied to a SHA-256 hash of your git remote URL (this hash is irreversible and reveals nothing about your notes or repository)
- No account, email, or personal information required

**What we store server-side:** Your repository hash (this serves as a nonidentifiable identifier for your repository) and we generate minimal payment metadata required to provide you with a license key: (unique_id, is_renewable, license_type, creation_date, expiry_date, transfer_date, optional transfer_password_hash). Nothing else.

### Payments

Payments are processed through platform app stores, please refer to the Privacy Policy of the payment provider regarding their data collection practices:

- [Google Play](https://policies.google.com/privacy)
- [Apple App Store](https://www.apple.com/legal/privacy/)
- [Stripe](https://stripe.com/privacy) (web purchases)

We use RevenueCat to process the payment from the above providers however we **do not** use RevenueCat in the app itself as their privacy practices don't meet our standards and offered us no way to opt out.

Cryptocurrency payments are an option but generating the license must be (currently) processed manually, send me a message on [Matrix](https://matrix.to/#/#cache-app:matrix.org) to organise.

---

## The Website

We use [Umami](https://umami.is/), an open-source, privacy-focused analytics tool, to understand how visitors use our site and documentation. Umami collects no personal or identifiable information.

---

## Third-Party Services Summary

| Service | Purpose | Your data |
|---------|---------|-----------|
| Your git provider | Note sync | Your notes (encrypted in transit) |
| App stores / Stripe | Payments | Payment info (per their policies) |
| Umami | Website analytics | None identifiable |

---

## Contact

Questions? [support@rocketware.co.uk](mailto:support@rocketware.co.uk)
