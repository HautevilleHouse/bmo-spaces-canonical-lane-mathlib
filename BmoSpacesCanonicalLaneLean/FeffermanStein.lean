import canonicalLaneMathlib.AdmissibleClass
import BmoSpacesCanonicalLaneLean.BmoDefinition

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

structure FeffermanSteinDecomposition (P : BmoPackage) where
  decomposition : (P.space.underlyingSpace → ℝ) → Prop
  sumOfTerms : Prop
  controlInBmo : Prop

structure FeffermanSteinEvidence {P : BmoPackage} (F : FeffermanSteinDecomposition P) where
  decompositionClosed : F.decomposition
  sumOfTermsClosed : F.sumOfTerms
  controlInBmoClosed : F.controlInBmo

def FeffermanSteinClosed {P : BmoPackage} (F : FeffermanSteinDecomposition P) : Prop :=
  F.decomposition ∧ F.sumOfTerms ∧ F.controlInBmo

theorem fefferman_stein_closed_from_evidence {P : BmoPackage} (F : FeffermanSteinDecomposition P) (E : FeffermanSteinEvidence F) : FeffermanSteinClosed F := by
  exact And.intro E.decompositionClosed (And.intro E.sumOfTermsClosed E.controlInBmoClosed)

end BmoSpacesCanonicalLaneLean
end HautevilleHouse