module.exports = {
	// set your styleguidist configuration here
	title: 'Default Style Guide',
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
			name: 'Getting Started',
			content: './README.md',
			sectionDepth: 1
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
