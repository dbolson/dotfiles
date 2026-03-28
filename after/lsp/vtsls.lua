return {
	settings = {
		typescript = {
			editor = {
				codeActionOnSave = {
					source = {
						organizeImports = "explicit",
            removeUnusedImports = true,
					},
				},
			},
			inlayHints = {
				enumMemberValues = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				variableTypes = { enabled = true },
			},
		},
	},
}
