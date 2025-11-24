## Initial setup for three branches

Clone or create a repo from: https://github.com/cotes2020/chirpy-starter

Later, create the three branches for easier code management.

I proposed the creation of three branches for using Chirpy theme, make my own modifications, mix it all and put it into github pages in the main branch.

From ChatGPT IA on 20251123:

Great! Your branch naming plan looks clear and effective:

    chirpy-base: Will track the clean, unmodified Chirpy starter template.

    chirpy-mods: Your branch with custom modifications and minimal changes.

    chirpy-mix: The merged branch combining chirpy-base with chirpy-mods, for final testing and deployment.

Suggested workflow

    Keep chirpy-base up to date:
    Periodically fetch and merge changes from the official chirpy-starter repo into chirpy-base.

    Work on your features in chirpy-mods:
    Make and test your customizations isolated from the base.

    Merge to chirpy-mix:
    Combine chirpy-base and chirpy-mods. Resolve conflicts here, test thoroughly.

    Deploy from chirpy-mix or merge to main:
    Once stable, you can deploy or move the code to your main deployment branch.

Using this structure will keep your project organized, maintainable, and facilitate future updates from the official starter. If you want, I can help you with concrete git commands for this setup.

## Initial branch creation script

```
# Create and push the base branch from the official starter template
git checkout -b chirpy-base
git push -u origin chirpy-base

# Create and push your modifications branch from chirpy-base (or from current)
git checkout -b chirpy-mods
git push -u origin chirpy-mods

# Create the mixed branch from chirpy-base
git checkout -b chirpy-mix chirpy-base
git push -u origin chirpy-mix
```


