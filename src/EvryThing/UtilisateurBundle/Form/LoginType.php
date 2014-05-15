<?php
// src/EvryThing/BlogBundle/Form/LoginType.php

namespace EvryThing\UtilisateurBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;

class LoginType extends AbstractType
{
	public function buildForm(FormBuilderInterface $builder, array $options)
	{
		$builder->add('nom', 'text');
		$builder->add('pwd', 'password');
		//$builder->add('remember_me', 'checkbox');
		$builder->add('submit', 'submit'); // new!
	}
/*
	public function	setDefaultOptions(optionsResolverInterface $resolver)
	{
		$resolver->setDefaults(array(
			'csrf_field_name'=>'_csrf_token', 				'intention'=>'authenticate',
		));
	}
*/

    public function getName()
    {
        return 'login';
    }
}

