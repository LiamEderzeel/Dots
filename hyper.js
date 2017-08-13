module.exports = {
	config: {
		// default font size in pixels for all tabs
		fontSize: 13,

		// font family with optional fallbacks
		fontFamily: '"Roboto Mono", "Roboto Mono for Powerline", "Meslo LG S for Powerline", monospace',
		// fontFamily: '"Roboto Mono", "Roboto Mono for Powerline", "Meslo LG S for Powerline", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',
		// fontFamily: 'Hack,"Liberation Mono for Powerline", monospace',
		// fontFamily: '"Liberation Mono for Powerline", "Meslo LG S for Powerline", Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',

		// terminal cursor background color (hex)
		cursorColor: 'rgba(255,255,255,.4)',

		// color of the text
		foregroundColor: 'rgba(255,255,255, 0.9)',

		// terminal background color
		backgroundColor: 'rgb(28, 28, 28)',

		// border color (window, tabs)
		borderColor: 'rgba(255,255,255,.1)',

        termCSS: `
        `,

		// custom css to embed in the main window
		css: `
		`,

		// custom padding (css format, i.e.: `top right bottom left`)

		// custom padding
		// padding: '0px 5px',

		// some color overrides. see http://bit.ly/29k1iU2 for
		// the full list
	},

	// a list of plugins to fetch and install from npm
	// format: [@org/]project[#version]
	// examples:
	//   `hyperpower`
	//   `@company/project`
	//   `project#1.0.1`
	// plugins: ["hyperterm-lastpass"],

	// in development, you can create a directory under
	// `~/.hyperterm_plugins/local/` and include it here
	// to load it and avoid it being `npm install`ed
	localPlugins: ["hyperterm-solo-dark"]
}
