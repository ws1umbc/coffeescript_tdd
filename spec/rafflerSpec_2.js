describe("Raffler", function() {


  it("should be defined", function() {
    expect(Raffler).toBeDefined();
  });

  describe("Raffler Collection", function() {
    it("should exist", function(){
      expect(Raffler.Collections).toBeDefined();
    });
  });

  describe("Raffler Models", function() {
    it("should exist", function(){
      expect(Raffler.Models.Entry).toBeDefined();
    });
    describe("Attributes", function() {
      entry = new Raffler.Models.Entry;
      it("should have default attributes", function() {
        expect(entry.attributes.name).toBeDefined();
        expect(entry.attributes.winner).toBeDefined();
      });
    });
    describe("Validations", function() {
      attrs = {};

      beforeEach(function() {
        attrs.name = 'John';
        attrs
      })
    })
  });

  describe("Raffler Routers", function() {
    it("should exist", function(){
      expect(Raffler.Routers.Entries).toBeDefined();
    });
  });

  describe("Raffler Views", function() {
    it("should exist", function(){
      expect(Raffler.Views.EntriesIndex).toBeDefined();
    });
  });

});

describe("localStorage called backbone-coffee-raffle", function() {
  it("should exist", function(){
    expect("localStorage.backbone-coffee-raffle").toBeDefined();
  });
});

// describe("Raffler Functions", function() {
//   var entries_index;

//   beforeEach(function() {
//     entries_index = new Raffler.Views.EntriesIndex();
//     //song = new Song();
//   });

//   describe("createEntry", function() {
//     it("should create an entry", function() {
//       entries_index.createEntry();
      
//     });
//   });
// });