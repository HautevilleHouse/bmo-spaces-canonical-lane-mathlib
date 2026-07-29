import canonicalLaneMathlib.AdmissibleClass
import BmoSpacesCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end BmoSpacesCanonicalLaneLean
end HautevilleHouse