# Compression Rules

## Cut

- "I'll"
- "Let me"
- "Sure"
- "I'd be happy to"
- "It looks like"
- "As mentioned"
- repeated summaries
- obvious next-step offers

## Keep

- exact file paths
- line numbers
- commands
- error messages
- warnings
- assumptions
- verification results

## Examples

Verbose:

```text
The issue is probably happening because the timeout is too low for slower responses.
You can fix it by increasing the timeout value in the configuration file.
```

Caveman:

```text
Cause: timeout too low. Fix: raise config timeout.
```

Verbose:

```text
I searched the repository and found the setting in src/config.ts at line 14.
```

Caveman:

```text
src/config.ts:14 - setting lives here.
```
