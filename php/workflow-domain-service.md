Création d'une méthode métier
=============================

1. Créer la signature de la méthode métier avec ses étapes en commentaire

```php
<?php
namespace AppBundle\Domain\Service\Survey;

use Fitnext\EngineBundle\Domain\Entity\Survey\SurveyUserSurvey;

use AppBundle\Domain\Entity\User;

/**
 * Create or update user surveys
 */
class UserSurveySaverService
{
    /**
     * Create weekly survey if necessary
     *
     * @param   User                $user   User instance
     * @return  SurveyUserSurvey            Created user survey
     */
    public function createWeeklySurveyIfNecessary(User $user)
    {
        // Define the current weekly survey period
        
        // Check if the current weekly survey is created
        
        // Create the weekly survey
    }
}
```

2. Créer la signature des sous méthodes

```php
<?php
namespace AppBundle\Domain\Service\Survey;

use Fitnext\EngineBundle\Domain\Entity\Survey\SurveyUserSurvey;

use AppBundle\Domain\Entity\User;
use AppBundle\Domain\Service\Survey\UserSurveyFinderService;

/**
 * Create or update user surveys
 */
class UserSurveySaverService
{
    /**
     * User survey finder service
     *
     * @var UserSurveyFinderService
     */
    protected $userSurveyFinder;

    /**
     * Constructor
     *
     * @param   UserSurveyFinderService $userSurveyFinder       User survey finder service
     */
    public function __construct(
        UserSurveyFinderService $userSurveyFinder
    ) {
        $this->userSurveyFinder = $userSurveyFinder;
    }

    /**
     * Create weekly survey if necessary
     *
     * @param   User                $user   User instance
     * @return  SurveyUserSurvey            Created user survey
     */
    public function createWeeklySurveyIfNecessary(User $user)
    {
        // Define the current weekly survey period
        $startAt = new \DateTime;
        $endAt = new \DateTime;

        // Check if the current weekly survey is created
        $userSurvey = $this->userSurveyFinder->getWeeklySurvey($user, $startAt, $endAt);
        if ($userSurvey instanceof SurveyUserSurvey) {
            return $userSurvey;
        }

        // Create the weekly survey
        return $this->createWeeklySurvey($user, $startAt, $endAt);
    }

    /**
     * Create weekly user survey
     *
     * @param   User                $user       User instance
     * @param   \DateTime           $startAt    Period start date
     * @param   \DateTime           $endAt      Period end date
     * @return  SurveyUserSurvey                Created user survey
     */
    protected function createWeeklySurvey(User $user, \DateTime $startAt, \DateTime $endAt)
    {
        // @todo
    }
}
```

3. Implémenter les étapes

4. Gérer les erreurs
