local patterns = require("nrpattern.default")

patterns[{"yes", "no"}] = { priority = 5 }
patterns[{"Debug", "Release"}] = { priority = 5 }

patterns[{"fn", "pub fn"}] = { priority = 5, filetypes = {"rust"} }
patterns[{"{}", "{:?}", "{:#?}"}] = { priority = 12, filetypes = {"rust"} } --FIX: does not work
patterns[{"#[derive()]", "#[derive(Clone,Debug,Default)]", "#[derive(Clone,Debug,Default,Serialize,Deserialize)]"}] = { priority = 5, filetypes = {"rust"} }
patterns[{"unwind", "abort"}] = { priority = 5, filetypes = {"toml"} }
patterns[{"fat", "thin"}] = { priority = 5, filetypes = {"toml"} }
patterns[{"none", "debuginfo", "symbols"}] = { priority = 5, filetypes = {"toml"} }

patterns[{"NULL", "nullptr"}] = { priority = 5, filetypes = {"cpp", "c"} }

return patterns
