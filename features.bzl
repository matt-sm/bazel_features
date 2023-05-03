load("@bazel_features_globals//:globals.bzl", "globals")
load("//private:util.bzl", "ge", "gt", "le", "lt", "ne")

_bzlmod = struct(
    # Whether --enable_bzlmod is set, and thus, whether str(Label(...)) produces canonical label
    # literals (i.e., "@@repo//pkg:file").
    is_enabled = str(Label("//:invalid")).startswith("@@")
)

_cc = struct(
    # Whether @bazel_tools//tools/cpp:optional_current_cc_toolchain and the `mandatory` parameter
    # on find_cpp_toolchain are available (#17308).
    # Note: While the target and parameter are available in 6.1.0, they only take effect in Bazel 7.
    find_cpp_toolchain_has_mandatory_param = ge("6.1.0"),
)

_rules = struct(
    # Whether TemplateDict#add_joined allows the map_each callback to return a list of strings (#17306)
    template_dict_map_each_can_return_list = ge("6.1.0"),
)

_toolchains = struct(
    # Whether the mandatory parameter is available on the config_common.toolchain_type function, and thus, whether optional toolchains are supported
    # https://bazel.build/versions/6.0.0/extending/toolchains#optional-toolchains
    has_optional_toolchains = ge("6.0.0"),
)

bazel_features = struct(
    bzlmod = _bzlmod,
    cc = _cc,
    globals = globals,
    rules = _rules,
    toolchains = _toolchains,
)