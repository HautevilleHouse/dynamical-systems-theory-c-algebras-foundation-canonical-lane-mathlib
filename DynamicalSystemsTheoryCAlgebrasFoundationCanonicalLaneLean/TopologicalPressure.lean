import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundation

structure TopologicalPressurePackage where
  continuousAction : Type u
  pressureFunctional : Prop
  variationalPrinciple : Prop
  equilibriumStatesExist : Prop

structure TopologicalPressureEvidence (T : TopologicalPressurePackage) where
  pressureFunctionalClosed : T.pressureFunctional
  variationalPrincipleClosed : T.variationalPrinciple
  equilibriumStatesExistClosed : T.equilibriumStatesExist

def TopologicalPressureClosed (T : TopologicalPressurePackage) : Prop :=
  T.pressureFunctional ∧ T.variationalPrinciple ∧ T.equilibriumStatesExist

theorem topological_pressure_closed_from_evidence (T : TopologicalPressurePackage) (E : TopologicalPressureEvidence T) :
    TopologicalPressureClosed T := by
  exact And.intro E.pressureFunctionalClosed
    (And.intro E.variationalPrincipleClosed E.equilibriumStatesExistClosed)

end DynamicalSystemsTheoryCAlgebrasFoundation
end HautevilleHouse