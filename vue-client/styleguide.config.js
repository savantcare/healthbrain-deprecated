module.exports = {
	// Ref: https://vue-styleguidist.github.io/docs/GettingStarted.html
	title: 'Docs',
	pagePerSection: true,
	exampleMode: 'expand',
	sections: [
		{
			name: 'Why',
			content: '../README.md',
			pagePerSection: true,
			sectionDepth: 1,
			// Ref: https://vue-styleguidist.github.io/docs/Components.html#sections
			sections: [
				{
					name: 'ui-why',
					content: './docs/ui-why.md',
					sectionDepth: 4
				},		
				{
					name: 'tech-how',
					content: '../docs/tech-howto.md',
					sectionDepth: 4
				},		
				{
					name: 'tech-why',
					content: '../docs/tech-why.md',
					sectionDepth: 4
				},		
				{
					name: 'misc',
					content: '../docs/misc.md',
					sectionDepth: 4
				},		
			],
		},
		{
			name: 'Components',
			content: './docs/components.md',
			pagePerSection: true,
			components: './src/components/**/[A-Z]*.vue',
			sectionDepth: 2,
			sections: [
				{
					name: 'Recommendations',
					content: './docs/ui-why.md',
					sectionDepth: 4
				},		
				{
					name: 'Reminders',
					content: './docs/ui-why.md',
					sectionDepth: 4
				},		
				{
					name: 'Goals',
					content: './docs/ui-why.md',
					sectionDepth: 4
				},		
				{
					name: 'Service statement',
					content: './docs/ui-why.md',
					sectionDepth: 4
				},		
				{
					name: 'Assessment',
					content: './docs/ui-why.md',
					sectionDepth: 4
				},		
				{
					name: 'Social history',
					content: './docs/ui-why.md',
					sectionDepth: 4
				},		

			],
		}
	]	
}
