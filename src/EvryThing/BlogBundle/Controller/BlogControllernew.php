<?php
// src/EvryThing/BlogBundle/Controller/BlogController.php

namespace EvryThing\BlogBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Httpfoundation\Response;
use EvryThing\BlogBundle\Entity\Article;

class BlogController extends Controller
{
  public function accueilAction($page)
	{
		// On ne sait pas combien de pages il y a
		// Mais on sait qu'une page doit être supérieure ou égale à 1
		if( $page < 1 )
		{
		  // On déclenche une exception NotFoundHttpException
		  // Cela va afficher la page d'erreur 404 (on pourra personnaliser cette page plus tard d'ailleurs)
		  throw $this->createNotFoundException('Page inexistante (page = '.$page.')');
		}

		// On récupère le repository
	  $repository = $this->getDoctrine()
						 ->getManager()
						 ->getRepository('EvryThingBlogBundle:Article');

	  // On récupère l'entité correspondant à l'id $id
	  $article = $repository->find(1);

	  // $article est donc une instance de EvryThing\BlogBundle\Entity\Article
		return $this->render('EvryThingBlogBundle:Blog:accueil.html.twig', array('article' => $article));
	}
  
  
  public function voirAction($id)
  {
    // Ici, on récupérera l'article correspondant à l'id $id
    
    return $this->render('EvryThingBlogBundle:Blog:voir.html.twig');
  }
  
  public function ajouterAction()
  {
    // Création de l'entité
    $article = new Article();
    $article->setTitre('actualités');
    $article->setTaille('grand');
	$article->setImage('bundles/evrythingblog/images/wei2013.jpg');
	$article->setAuteur('Bibi');
    $article->setContenu('C\'était vraiment super et on s\'est bien amusé.');
	
    // On peut ne pas définir ni la date ni la publication,
    // car ces attributs sont définis automatiquement dans le constructeur

    // On récupère l'EntityManager
    $em = $this->getDoctrine()->getManager();

    // Étape 1 : On « persiste » l'entité
    $em->persist($article);

    // Étape 2 : On « flush » tout ce qui a été persisté avant
    $em->flush();
    
    if ($this->getRequest()->getMethod() == 'POST') {
      $this->get('session')->getFlashBag()->add('info', 'Article bien enregistré');
      return $this->redirect( $this->generateUrl('sdzblog_voir', array('id' => $article->getId())) );
    }

    return $this->render('EvryThingBlogBundle:Blog:ajouter.html.twig');


  }
  
  public function modifierAction($id)
  {
    // Ici, on récupérera l'article correspondant à $id

    // Ici, on s'occupera de la création et de la gestion du formulaire

    return $this->render('EvryThingBlogBundle:Blog:modifier.html.twig');
  }

  public function supprimerAction($id)
  {
    // Ici, on récupérera l'article correspondant à $id

    // Ici, on gérera la suppression de l'article en question

    return $this->render('EvryThingBlogBundle:Blog:supprimer.html.twig');
  }
}