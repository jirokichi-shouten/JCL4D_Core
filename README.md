# JCL4D_Core

Jirokichi Common Library for 4D Project mode.

`JCL4D_Core` contains reusable 4D classes, project methods, forms, and resources that do not depend on `4D_CAT`.

## Source project

Open `Project/JCL4D_Core.4DProject` with 4D.

## Use as a component

For interpreted development, install this project in the host project's
`Components` directory under the package name `JCL4D_Core.4dbase`. A relative
symbolic link can be used when the host and component repositories are siblings:

```text
HostProject/Components/JCL4D_Core.4dbase -> ../../JCL4D_Core
```

Project methods exposed to the host must have `"shared":true` in their
`//%attributes` declaration. A compiled host requires a compiled component.

## Distribution and build policy (provisional)

Development uses `JCL4D_Core` as an independent interpreted component. An
unbuilt 4D project is distributed with the component intact; this is expected to
be the primary option for client/server deployments. For a built release, either
package a compiled component or expand the component's source files and resources
into the host before building. `JCL4D_Core` remains the source of truth; expanded
files must not be edited directly. Any expansion should be a reproducible build
step.

## Extraction policy

- Compare the implementation in `4D_CAT` with the JCL4D manual before moving it.
- Keep reusable, application-independent code in this repository.
- Keep generators, `fields.txt` handling, templates, and CAT-specific UI in `4D_CAT`.
- Move forms together with their required resources.

Manual: https://jiro2013.sakura.ne.jp/jcl4d_man/
