<?php

namespace EvryThing\DocumentBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class DocumentType extends AbstractType
{
        /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('libelle', 'text')
            ->add('description', 'textarea')
			->add('dossier', 'choice', array('choices' => array(1 => "test1", 2 => 'test2', 3 => "test3"),
				'multiple' => false,
				'expanded' => false,
				'empty_value' => '- Choisissez une option -',
				'empty_data'  => -1))
			->add('file', 'file')
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'EvryThing\DocumentBundle\Entity\Document'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'evrything_documentbundle_document';
    }
}
