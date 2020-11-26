'use strict'

fg = friGame

changeAnimation = () ->
	img = document.getElementById('images').value
	if not img
		return

	document.getElementById('Name').textContent = img

	numFrames = Number(document.getElementById('numFrames').value)
	rate = Number(document.getElementById('rate').value)
	type = fg.ANIMATION_HORIZONTAL
	for element in document.getElementsByName('animType')
		if element.checked
			if element.value == 'vertical'
				type = fg.ANIMATION_VERTICAL

			break

	pingpong = document.getElementById('pingpong').checked
	backwards = document.getElementById('backwards').checked
	offsetx = Number(document.getElementById('offsetx').value)
	offsety = Number(document.getElementById('offsety').value)

	fg.resourceManager
		.clear()
		.addAnimation('anim', img, {
			numberOfFrame: numFrames
			rate: rate
			type: type
			pingpong: pingpong
			backwards: backwards
			offsetx: offsetx
			offsety: offsety
		})

	fg.startGame(() ->
		fg.playground()
			.clear()
			.addSprite('anim', {animation: 'anim', centerx: fg.s.playground.halfWidth, centery: fg.s.playground.halfHeight})

		return
	)
	return

fg.ready(() ->
	fg.startGame(() ->
		# Initialize the playground
		fg.playground()

		document.getElementById('images').addEventListener('change', changeAnimation, false)
		document.getElementById('numFrames').addEventListener('change', changeAnimation, false)
		document.getElementById('rate').addEventListener('change', changeAnimation, false)
		document.getElementById('offsetx').addEventListener('change', changeAnimation, false)
		document.getElementById('offsety').addEventListener('change', changeAnimation, false)
		document.getElementById('animHorizontal').addEventListener('input', changeAnimation, false)
		document.getElementById('animVertical').addEventListener('input', changeAnimation, false)
		document.getElementById('pingpong').addEventListener('input', changeAnimation, false)
		document.getElementById('backwards').addEventListener('input', changeAnimation, false)
		return
	)
	return
)

