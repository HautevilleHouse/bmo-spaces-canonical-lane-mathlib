import HautevilleHouse.BmoSpacesCanonicalLaneLean.BmoAdmissibleClass

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  JohnNirenbergEvidence A.object.function

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  -- We need to provide evidence. Since A is admissible, it has a gate witness.
  -- But we need to produce JohnNirenbergEvidence. For now, we can assume it's given by the object.
  sorry

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end BmoSpacesCanonicalLaneLean
end HautevilleHouse