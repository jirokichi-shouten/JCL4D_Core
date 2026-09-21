# JCL4D_Core

Jirokichi Common Library for 4D Project mode.

`JCL4D_Core` contains reusable 4D classes, project methods, forms, and resources that do not depend on `4D_CAT`.

## Source project

Open `Project/JCL4D_Core.4DProject` with 4D.

## Use as a component

For interpreted development with 4D 20 LTS, place a macOS Finder alias of
`Project/JCL4D_Core.4DProject` in the host project's `Components` directory.
Keep the host and component repositories as sibling directories. A POSIX symbolic
link is not equivalent to a Finder alias and is not recognized by this setup.

On Windows, use a Windows shortcut to the same `.4DProject` file. Finder aliases
and Windows shortcuts are platform-specific and should normally be created on
each development machine. When the target environment supports the Dependency
Manager (4D 20 R6 or later, including 4D 21), consider replacing these links with
`Project/Sources/dependencies.json`. Verify support in the exact 4D edition and
version before switching.

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
