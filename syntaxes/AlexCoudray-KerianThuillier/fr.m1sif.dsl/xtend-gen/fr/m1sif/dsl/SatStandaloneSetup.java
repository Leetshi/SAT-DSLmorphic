/**
 * generated by Xtext 2.19.0
 */
package fr.m1sif.dsl;

import fr.m1sif.dsl.SatStandaloneSetupGenerated;

/**
 * Initialization support for running Xtext languages without Equinox extension registry.
 */
@SuppressWarnings("all")
public class SatStandaloneSetup extends SatStandaloneSetupGenerated {
  public static void doSetup() {
    new SatStandaloneSetup().createInjectorAndDoEMFRegistration();
  }
}
