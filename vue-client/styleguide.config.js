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
					components: './src/components/**/*Recomm*.vue'
				},		
				{
					name: 'Reminders',
					components: './src/components/**/*Remin*.vue'
				},		
				{
					name: 'Goals',
					components: './src/components/**/*Goal*.vue'
				},		
				{
					name: 'Service statement',
					components: './src/components/**/*Service*.vue'
				},		
				{
					name: 'Assessment',
					components: './src/components/**/*Assess*.vue'
				},		
				{
					name: 'Social history',
					components: './src/components/**/*Social*.vue'
				},		

			],
		}
	]	
}
