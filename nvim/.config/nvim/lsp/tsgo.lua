return {
	cmd = { "tsgo", "--lsp", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	root_markers = {
		"tsconfig.json",
		"jsconfig.json",
		"package.json",
		".git",
		"tsconfig.base.json",
		"tsconfig.spec.json",
	},
	settings = {
		typescript = {
			inlayHints = {
				enumMemberValues = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				parameterNames = {
					enabled = "literals",
					suppressWhenArgumentMatchesName = true,
				},
				parameterTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				variableTypes = { enabled = true },
			},
			-- tsserver = {
			-- 	maxTsServerMemory = 8192,
			-- },
		},
	},
}
