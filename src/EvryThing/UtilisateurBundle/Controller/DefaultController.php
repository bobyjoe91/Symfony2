<?php

namespace EvryThing\UtilisateurBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('EvryThingUtilisateurBundle:Default:index.html.twig', array('name' => $name));
    }
}
