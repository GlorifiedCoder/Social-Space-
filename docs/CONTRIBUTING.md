# Contribution and Change Workflow

1. Keep each change tied to a requirement or documented bug.
2. Use a feature branch for meaningful work.
3. Keep changes focused and reviewable.
4. Add tests with the feature.
5. Update docs when product behavior or architecture changes.
6. Do not commit credentials, local machine paths, generated secrets, or signing materials.
7. Use conventional commit messages where practical, for example:
   - `feat(home): restore last selected workspace`
   - `feat(notes): add local note search`
   - `fix(home): handle disabled saved platform`
   - `test(workspace): cover reorder restoration`
8. Review `git diff` before committing.
