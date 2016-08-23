# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$text = $('.account').text()
	$img = $('.account').find('img')
	$('.has-application').bootstrapSwitch 'state', true
	$switchState = $('.has-application').bootstrapSwitch 'state'
	$('.application-info').prop 'disabled', !$switchState
	$('.account').mouseover ->
		$(this).text ' Signout'
		$(this).prepend $img 
	$('.account').mouseout ->
		$(this).text $text
		$(this).prepend $img
	$('.bootstrap-switch-id-coin_has_application').on 'switchChange.bootstrapSwitch', ->
		$('.application-info').prop 'disabled', $switchState
	$('ul#info-menu > li').click ->
		selector = 'ul#' + $(this).attr 'id'
		$('.show-all').removeClass 'active-item'
		$('ul.full-category-cnt').hide()
		$(selector).show()
	$('#show-all').click ->
		$('ul.full-category-cnt').show()
	$("a#add-another-repo").on "click", ->
		$parent_id = $(this).parent().attr 'id'
		$parent_id_length = $parent_id.length
		$repo_number = parseInt($parent_id.substring($parent_id_length - 1,$parent_id_length))
		$repo_plus_one = $repo_number + 1
		$parent_html = $(this).parent().parent().clone()
		$parent_html.first().find("input").attr 'name', 'coin[repositories][' + $repo_plus_one + '][name]'
		$parent_html.first().find("input").attr 'value', ''
		$parent_html_to_insert = '<div class="row grouped-row grouped-row-last">' + $parent_html.html() + '</div>'
		$prev_parent_html = $(this).parent().parent().prev().clone()
		$prev_parent_html.first().find("input").attr 'name', 'coin[repositories][' + $repo_plus_one + '][name]'
		$prev_parent_html.first().find("input").attr 'value', ''
		$prev_parent_html_to_insert = '<div class="row grouped-row grouped-row-first">' + $prev_parent_html.html() + '</div>'
		$(this).hide()
		$(this).parent().parent().after $prev_parent_html_to_insert + $parent_html_to_insert
	$("a#add-another-exchange").on "click", ->
		$parent_id = $(this).parent().attr 'id'
		$parent_id_length = $parent_id.length
		$xchange_number = parseInt($parent_id.substring($parent_id_length - 1,$parent_id_length))
		$xchange_plus_one = $repo_number + 1
		$parent_html = $(this).parent().parent().clone()
		$parent_html.first().find("input").attr 'name', 'coin[exchanges][' + $xchange_plus_one + '][name]'
		$parent_html.first().find("input").attr 'value', ''
		$parent_html_to_insert = '<div class="row grouped-row grouped-row-last">' + $parent_html.html() + '</div>'
		$prev_parent_html = $(this).parent().parent().prev().clone()
		$prev_parent_html.first().find("input").attr 'name', 'coin[exchanges][' + $xchange_plus_one + '][name]'
		$prev_parent_html.first().find("input").attr 'value', ''
		$prev_parent_html_to_insert = '<div class="row grouped-row grouped-row-first">' + $prev_parent_html.html() + '</div>'
		$(this).hide()
		$(this).parent().parent().after $prev_parent_html_to_insert + $parent_html_to_insert

		###
		if $(".coin-main-info").length > 0
		chart = new (cryptowatch.Embed)('coinbase', 'btcusd',
			height: 300
			customColorScheme:
				bg: 'fdeee9'
				text: '545454'
				textStrong: '545454'
				textWeak: '999999'
				short: 'EB3333'
				shortFill: 'EB3333'
				long: '23a06d'
				longFill: '23a06d'
				cta: '000000'
				ctaHighlight: '000000'
				alert: '000000')

		chart.mount '#chart'
		###

	$prev_scroll_top = 0

	$(window).on "scroll", ->
		$scroll_height = $('body').prop 'scrollHeight'
		$scroll_top = $('body').scrollTop()
		$up_or_down
		if $prev_scroll_top > $scroll_top
			$up_or_down = "up"
		else
			$up_or_down = "down"
		$body_height = $('body').height()
		$remaining = $scroll_height - ($scroll_top + $body_height)
		if $remaining < 40
			$curr_bottom = $('.action-links').css('bottom')
			$curr_bottom = 40 + (40 - $remaining)
			$('.action-links').css 'bottom', $curr_bottom
		else 
			$('.action-links').css 'bottom', 30



		

