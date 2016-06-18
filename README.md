# README

A sample app developed to understand how best to model a feature "Data Visibility" ... for a huge app.


## Generating a model relationship diagram ...

We use a utility to generate a model relationship diagram: https://github.com/preston/railroady

To regenerate, simply do:

    rake diagram:models:all
 
![Model diagram](./doc/models_brief.svg) 
![Model diagram](./doc/models_complete.svg)


## Generating annotations

Model annotations provided by canonical: https://github.com/ctran/annotate_models

To regenerate, simply do:

    bundle exec annotate