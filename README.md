#

Attempts to debug a shims on dbt macros in a third party library (aka dbt package).

The [official documentation](https://docs.getdbt.com/reference/project-configs/dispatch-config) is used a a guide but something is not quite right yet.

## Developer Guide

The relevant scripts are at `.envrc` and `debug.sh`.
Either run whatever version of that code is appropriate for your setup or:

1. install asdf
2. install direnv
3. run `asdf install` to install python from `.tool-versions`
4. run `direnv allow` in this directory
5. run:
```
chmod +x debug.sh
bash ./debug.sh

```

The output of the compile command for me is:

```bash
$ dbt compile -s example
09:44:27  Running with dbt=1.7.3
09:44:30  Registered adapter: bigquery=1.7.2
09:44:30  Unable to do partial parsing because a project config has changed
09:44:31  Found 1 model, 0 sources, 0 exposures, 0 metrics, 454 macros, 0 groups, 0 semantic models
09:44:31
09:44:33  Concurrency: 1 threads (target='bq')
09:44:33
09:44:33  Compiled node 'example' is:
select "library" as foo

```

There are three files with variations of the same macro.

- `~/dbt_project_shimmed/macros/my_macro.sql`
- `~/dbt_project_shimmed/dbt_packages/dbt_library_shimmed/macros/my_macro.sql`
- `~/dbt_project_shimmed/dbt_packages/dbt_library/macros/my_macro.sql`

I want the macro in the last file to be overriden by shims in the first two files but something is not quite right yet.

I keep getting:

`select "library" as foo`

but by changing the macro namespace in dbt_project.yml, I should be able to yield:

`select "dbt_library_shimmed" as foo`

or

`select "dbt_project_shimmed" as foo`
