describe('Basic Tests', () => {
  before(() => {
    cy.startScenario() // This would automatically go to the scenario being tested. Without this the test will fail.
  });

  it('finds the content "Start Scenario"', () => {
    cy.contains('Start Scenario');
  });

  it('finds can run commands', () => {
    cy.terminalType("uname");

    cy.terminalShouldContain('Linux');
  })
})
