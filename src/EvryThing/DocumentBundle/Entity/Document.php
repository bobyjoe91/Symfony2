<?php

namespace EvryThing\DocumentBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\UploadedFile;

/**
 * Document
 *
 * @ORM\Table()
 * @ORM\Entity(repositoryClass="EvryThing\DocumentBundle\Entity\DocumentRepository")
 */
class Document
{
	/**
	* @ORM\ManyToOne(targetEntity="EvryThing\UtilisateurBundle\Entity\User")
	* @ORM\JoinColumn(nullable=false)
	*/
	private $user;
    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="libelle", type="string", length=255)
     */
    private $libelle;

    /**
     * @var string
     *
     * @ORM\Column(name="source", type="string", length=1000)
     */
    private $source;
	
	 /**
     * @var string
     *
     * @ORM\Column(name="dossier", type="string", length=1000)
     */
    private $dossier;

    /**
     * @var string
     *
     * @ORM\Column(name="description", type="string", length=255)
     */
    private $description;

    /**
     * @var string
     *
     * @ORM\Column(name="type", type="string", length=255)
     */
    private $type;
	
	private $file;


	public function __construct()
	{
		$this->date = new \Datetime();
	}
	
	/**
     * Get user
     *
     * @return EvryThing\UtilisateurBundle\Entity\User $user 
     */
	public function getUser(){
		return $this->user;
	}
	
	/**
	 * Set user
	 *
	 * @param EvryThing\UtilisateurBundle\Entity\User $user
	 */
	public function setUser($user){
		$this->user = $user;
	}
	
    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set libelle
     *
     * @param string $libelle
     * @return Document
     */
    public function setLibelle($libelle)
    {
        $this->libelle = $libelle;

        return $this;
    }

    /**
     * Get libelle
     *
     * @return string 
     */
    public function getLibelle()
    {
        return $this->libelle;
    }

    /**
     * Set source
     *
     * @param string $source
     * @return Document
     */
    public function setSource($source)
    {
        $this->source = $source;

        return $this;
    }

    /**
     * Get source
     *
     * @return string 
     */
    public function getSource()
    {
        return $this->source;
    }

    /**
     * Set dossier
     *
     * @param string $dossier
     * @return Document
     */
    public function setDossier($dossier)
    {
        $this->dossier = $dossier;

        return $this;
    }

    /**
     * Get dossier
     *
     * @return string 
     */
    public function getDossier()
    {
        return $this->dossier;
    }
	
    /**
     * Set description
     *
     * @param string $description
     * @return Document
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string 
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set type
     *
     * @param string $type
     * @return Document
     */
    public function setType($type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type
     *
     * @return string 
     */
    public function getType()
    {
        return $this->type;
    }
	
	public function getFile(){
		return $this->file;
	}
	
	public function setFile(UploadedFile $file){
		$this->file = $file;
	}
	
	public function upload()
	{
		// Si jamais il n'y a pas de fichier (champ facultatif)
		if (null === $this->file) {
		  return;
		}
		// On garde le nom original du fichier de l'internaute
		$name = $this->file->getClientOriginalName();

		// On déplace le fichier envoyé dans le répertoire de notre choix
		$this->file->move($this->getUploadRootDir(), $name);
		
		$this->source = $name;
		$this->type = "test";
	}

	public function getUploadDir()
	{
		// On retourne le chemin relatif vers l'image pour un navigateur
		return $this->dossier;
	}

	protected function getUploadRootDir()
	{
		// On retourne le chemin relatif vers l'image pour notre code PHP
		return __DIR__.'/../../../../web/'.$this->getUploadDir();
	}
}
