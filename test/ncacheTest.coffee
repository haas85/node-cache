describe "node-cache", ->

  it "is healthy", ->
    expect(Cache).toBeTruthy()

  it "save and get element", ->

    Cache.set 1, "FOO", 100

    expect(Cache.get 1).toEqual "FOO"

  it "save and remove element", ->

    Cache.set 1, "FOO", 100

    expect(Cache.get 1).toEqual "FOO"

    expect(Cache.remove 1).toBe true
    expect(Cache.remove 1).toBe false

    expect(Cache.get 1).toEqual null

  it "element expires", ->

    Cache.set 5, "FOO5", 2

    expect(Cache.get 5).toEqual "FOO5"

    getter = () ->expect(Cache.get 5).toEqual null

    setTimeout getter, 2500