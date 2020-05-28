module.exports = {
	// set your styleguidist configuration here
	title: 'Healthbrain documentation',
	// components: 'src/components/**/[A-Z]*.vue',
	// defaultExample: true,
	// sections: [
	//   {
	//     name: 'First Section',
	//     components: 'src/components/**/[A-Z]*.vue'
	//   }
	// ],
	// webpackConfig: {
	//   // custom config goes here
	// },
	pagePerSection: true,
	exampleMode: 'expand',
	sections: [
		{
			name: 'Getting-started',
			content: '../README.md',
			pagePerSection: true,
			sectionDepth: 1,
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
			],
		},
		{
			name: 'Elements',
			content: './docs/elements.md',
			pagePerSection: true,
			components: './src/components/**/[A-Z]*.vue',
			sectionDepth: 2
		}
	]	
}
