About:

This is a simple flask app, with a single unit test.  The
project is managed with [UV](https://github.com/astral-sh/uv), and the linting/formatting is handled via [ruff](https://github.com/astral-sh/ruff).

Install:

Once you have `uv` installed, you can initiate the project via `uv sync` in the root dir.

Usage:

You can run the project via `uv`

```bash
uv run flask --app src.main run
```

You can confirm its working

```bash
curl localhost:5000/health
{"message":"Hello, World!"}
```

Task:

1. In our CI pipeline, we want to extend our dockerfile, to have a target called `test`, this target should have all our app code and tests.
2. The unit test is broken, we should fix it
3. Our code should really match all our other projects, so we need to make sure ruff believes its syntactically valid, how can we force that before committing.
4. How can we resolve the code quality issue we have?
5. Is there anything else you think would be beneficial in a CI/CD pipeline for this application?
