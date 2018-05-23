Red [needs: 'view']

words: ["c h e v a l" "e t o i l e" "u n i q u e" "c o q u e c i g r u e" "s a l s i f i s" "c o n i q u e" "s u p e r s t a r" "c i n e m a"]

view [
    title "Jeu du pendu"
    backdrop white
	across

	do [
    	reset: func [] [
			a: random/only words
			s: split a " " 
			t: ""
			l: 7
			lifeText: "7"
			isPlaying: true

			forall s [
				append t "_ "
			]
			trim t
		]
		
    	resetGame: func [] [
    		reset []
    		lifes/text: lifeText
    	]

    	isInWords: func [letter] [
    		if isPlaying [
	    		f: false
				it: 0
				foreach i s [
					it: it + 1
					u: uppercase i
					if i == letter [
						remove/part at answer/text it 1
						insert at answer/text it letter
						print answer/text
						if answer/text = a [
							lifes/text: "Victoire"
							isPlaying: false
						]
						f: true
					]
					it: it + 1
				]
				if f == false [
					l: l - 1
					either l = 0 [
						isPlaying: false
						lifes/text: "Perdu"
					] [
						lifeText: to string! l
						lifes/text: lifeText
					]
				]
    		]
		]

		reset[]
	]

    dr: base 400x400 draw [
    	pen white
    	line-width 402
    	line 0x200 400x200

        pen black
        line-width 5
        line-cap round

        line 100x300 300x300

        line 120x300 120x50

        line 120x70 230x70
        line 200x70 200x80

        circle 200x100 20

        line 200x120 200x200

        line 170x140 230x140

		line 170x230 200x200
    	line 200x200 230x230
    ]
    return

    answer: text t
    text "Vies restantes: "
    lifes: text lifeText return

    style b: button 35x35 [isInWords face/text]
    a: b "a" b "b" b "c" b "d" b "e" b "f" b "g" b "h" b "i" b "j" b "k" b "l" b "m" return
    b "n" b "o" b "p" b "q" b "r" b "s" b "t" b "u" b "v" b "w" b "x" b "y" b "z" return
    button "Recommencer" [resetGame []]
]