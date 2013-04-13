(function() {
  describe("Node Cache", function() {
    it("is healthy", function() {
      return expect(Cache).toBeTruthy();
    });
    it("save and get element", function() {
      Cache.set(1, "FOO", 100);
      return expect(Cache.get(1)).toEqual("FOO");
    });
    return it("save and delete element", function() {
      Cache.set(1, "FOO", 100);
      expect(Cache.get(1)).toEqual("FOO");
      expect(Cache["delete"](1)).toBe(true);
      expect(Cache["delete"](1)).toBe(false);
      return expect(Cache.get(1)).toEqual(null);
    });
  });

}).call(this);
