import canonicalLaneMathlib.AdmissibleClass
import BmoSpacesCanonicalLaneLean.AdmissibleClass
import BmoSpacesCanonicalLaneLean.BmoDefinition

namespace HautevilleHouse
namespace BmoSpacesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BmoWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end BmoSpacesCanonicalLaneLean
end HautevilleHouse