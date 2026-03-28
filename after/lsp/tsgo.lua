return {
	settings = {
		typescript = {
			capabilities = {
				workspace = {
					didChangeWatchedFiles = {
						dynamicRegistration = true,
					},
				},
			},
			init_options = {
				maxTsServerMemory = 8192,
			},

			inlayHints = {
				parameterNames = {
					enabled = "literals", -- "none" | "literals" | "all"
					suppressWhenArgumentMatchesName = false,
				},
				parameterTypes = {
					enabled = true,
				},
				variableTypes = {
					enabled = true,
					suppressWhenTypeMatchesName = false,
				},
				propertyDeclarationTypes = {
					enabled = true,
				},
				functionLikeReturnTypes = {
					enabled = true,
				},
				enumMemberValues = {
					enabled = true,
				},
			},
			organizeImports = {
				typeOrder = "last", -- "auto" | "last" | "first" | "inline"
				caseSensitivity = "auto", -- "auto" | "caseInsensitive" | "caseSensitive"
			},

			suggest = {
				autoImports = true,
				classMemberSnippets = { enabled = true },
				includeAutomaticOptionalChainCompletions = true,
				includeCompletionsForImportStatements = true,
				objectLiteralMethodSnippets = { enabled = true },
			},
		},
	},
}
