/*
 * generated by Xtext 2.19.0
 */
package ozhang

import com.google.inject.Inject
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.extensions.InjectionExtension
import org.eclipse.xtext.testing.util.ParseHelper
import org.junit.jupiter.api.Assertions
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.^extension.ExtendWith
import org.xtext.example.mydsl1.mSat.SATMorphic
import org.xtext.example.mydsl1.tests.MSatInjectorProvider
import ozhang.Solver

@ExtendWith(InjectionExtension)
@InjectWith(MSatInjectorProvider)
class MSatParsingMacherTest {
	@Inject
	ParseHelper<SATMorphic> parseHelper
	
	Solver solver = new Solver()
	
	@Test
	def void loadSAT4J_JAVA() {
		val result = parseHelper.parse('''
			solver 
				   sat4j-java
			benchmarkDIMACS "test.cnf", "test.cnf"
		''')
		Assertions.assertNotNull(result)
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: «errors.join(", ")»''')
		solver.solve(result)
	}
	
	@Test
	def void loadSAT4J_MVN() {
		val result = parseHelper.parse('''
			solver 
				   sat4j-maven
			benchmarkDIMACS "test.cnf"
		''')
		Assertions.assertNotNull(result)
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: «errors.join(", ")»''')
		solver.solve(result)
	}
	
	@Test
	def void loadSAT4J_JAR() {
		val result = parseHelper.parse('''
			solver 
				   sat4j-jar
			benchmarkDIMACS "test.cnf"
		''')
		Assertions.assertNotNull(result)
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: «errors.join(", ")»''')
		solver.solve(result)
	}
	
	@Test
	def void loadSAT4J_JAVA_formula() {
		val result = parseHelper.parse('''
			solver 
				   sat4j-java
			benchmarkFormula A ^ (!B)
		''')
		Assertions.assertNotNull(result)
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: «errors.join(", ")»''')
		solver.solve(result)
	}
	
	@Test
	def void loadSAT4J_JAR_formula() {
		val result = parseHelper.parse('''
			solver 
				   sat4j-jar
			benchmarkFormula (A ^ (!B))
		''')
		Assertions.assertNotNull(result)
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: «errors.join(", ")»''')
		solver.solve(result)
	}
	
	@Test
	def void loadSAT4J_MVN_formula() {
		val result = parseHelper.parse('''
			solver 
				   sat4j-maven
			benchmarkFormula (A ^ B)
		''')
		Assertions.assertNotNull(result)
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: «errors.join(", ")»''')
		solver.solve(result)
	}
	
	@Test
	def void benchmark_minisat_cryptominisat_test() {
		val result = parseHelper.parse('''
			solver minisat cryptominisat
			benchmarkFormula (A ^ B)
		''')
		Assertions.assertNotNull(result)
		val errors = result.eResource.errors
		Assertions.assertTrue(errors.isEmpty, '''Unexpected errors: «errors.join(", ")»''')
		solver.solve(result)
	}
}
