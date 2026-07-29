import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasFoundation

def bridgeClosed (A : AdmissibleClass) : Prop :=
  AdmittedClosure A

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  simp [bridgeClosed, admittedClosure]

end DynamicalSystemsTheoryCAlgebrasFoundation
end HautevilleHouse