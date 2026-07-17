# Security Policy

AI Gen Company Stack is a plugin and skill suite. Treat generated outputs as recommendations that require human review before production use.

## Report A Vulnerability

Report privately through GitHub Security Advisories:

- https://github.com/Dw-Dwain/AI-Gen-Company-Stack/security/advisories/new

Please do not open a public issue for a security problem. Include repro steps,
affected files or scripts, and impact. Expect an initial response within about
7 days. Do not include live secrets, tokens, or personal data in the report.

## Safety Defaults

- Defensive cybersecurity only.
- Human approval for destructive, costly, publishing, deployment, or external-contact actions.
- No redistribution of leaked prompt contents.
- No secrets in learning-loop logs. `scripts/learn.ps1` runs a best-effort secret
  redaction pass before writing any entry (verify with `learn.ps1 -SelfTest`).
- Project scaffolding refuses to target drive roots or protected system/profile
  paths before its `-Force` overwrite (`scripts/new-ai-project.ps1`).
- Backups before overwriting Codex skill folders.

## Before Production Use

- Review generated code.
- Run tests.
- Review dependency licenses.
- Verify model/provider data handling.
- Add rollback steps.
- Run security checks appropriate to your environment.
