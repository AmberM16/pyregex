describe "App Configuration", ->
  beforeEach module('pyregex')

  it "should have a value for API endpoint", inject (apiUrl) ->
    expect(apiUrl).toBe('/api')

  describe "factories", ->
    it "should reflect jQuery global object", inject (jQuery) ->
      expect(jQuery).toBe(window.jQuery)

    it "should reflect underscore (_) global object", inject (_) ->
      expect(_).toBe(window._)

    it "should reflect global window object", inject (_window_) ->
      expect(_window_).toBe(window)

  describe "filters", ->
    it "should return the number of elements of a given array or object",
      inject (lengthFilter) ->
        expect(lengthFilter(a: 1, b: 2, c: 3, d: 4)).toBe(4)
        expect(lengthFilter([1, 2, 3])).toBe(3)
        expect(lengthFilter([1, 2, 3, $$hashKey: {}])).toBe(3)
        expect(lengthFilter(a: 1, b: 2, $$hashKey: {})).toBe(2)

    it "should return a text with escaped html elements",
      inject (escapeHtmlFilter) ->
        original = "<Hello, world!\nThis is some extra & html chars</>\n"
        expected = "&lt;Hello, world!<br/>This is some extra &amp; " +
                   "html chars&lt;/&gt;<br/>&nbsp;"
        expect(escapeHtmlFilter(original)).toEqual expected


