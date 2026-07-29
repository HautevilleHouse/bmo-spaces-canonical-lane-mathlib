import canonicalLaneMathlib.AdmissibleClass
import BmoSpacesCanonicalLaneLean.BmoDefinition

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure JohnNirenbergPackage (P : BmoPackage) where
  inequality : Prop
  exponentialIntegrability : Prop
  constantControl : Prop

structure JohnNirenbergEvidence {P : BmoPackage} (J : JohnNirenbergPackage P) where
  inequalityClosed : J.inequality
  exponentialIntegrabilityClosed : J.exponentialIntegrability
  constantControlClosed : J.constantControl

def JohnNirenbergClosed {P : BmoPackage} (J : JohnNirenbergPackage P) : Prop :=
  J.inequality ∧ J.exponentialIntegrability ∧ J.constantControl

theorem john_nirenberg_closed_from_evidence {P : BmoPackage} (J : JohnNirenbergPackage P) (E : JohnNirenbergEvidence J) : JohnNirenbergClosed J := by
  exact And.intro E.inequalityClosed (And.intro E.exponentialIntegrabilityClosed E.constantControlClosed)

end BmoSpacesCanonicalLaneLean
end HautevilleHouse