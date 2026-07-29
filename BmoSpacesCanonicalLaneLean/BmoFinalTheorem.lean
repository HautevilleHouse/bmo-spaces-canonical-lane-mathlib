import HautevilleHouse.BmoSpacesCanonicalLaneLean.BmoBridgeLemmas

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

def ConstrainedBmoClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bmo_endgame (A : AdmissibleClass) : ConstrainedBmoClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BmoSpacesCanonicalLaneLean
end HautevilleHouse