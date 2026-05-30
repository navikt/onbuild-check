# onbuild-check

The Docker `ONBUILD` directive is a potential vector for supply chain attacks since it allows for arbitrary code execution in malicious base images.

This action checks whether `ONBUILD` is present in any of the images referenced by a `FROM` directive.

Inspired by [this][https://www.o3c.no/knowledge/unmasking-the-docker-onbuild-supply-chain-attack-vector] article.

### Usage

In your workflow yaml:

```yaml
steps:
  - name: Run onbuild detector action
    uses: navikt/onbuild-check@version
    with:
      mode: enforce
      dockerfile: /path/to/Dockerfile
```

```
mode: 'enforce'(default, exit with error if ONBUILDs are found) or 'audit' (just log it)

dockerfile: (path to the Dockerfile to check, default is './Dockerfile')
```

Releases are immutable.

### Questions ❓

Contact us at [#appsec](https://nav-it.slack.com/archives/C06P91VN27M) on Slack or open an issue.

