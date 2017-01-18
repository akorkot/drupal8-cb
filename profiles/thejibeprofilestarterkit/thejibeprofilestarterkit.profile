<?php
/**
 * @file
 * Enables modules and site configuration for a The Jibe Profile Starter Kit site installation.
 */

use Drupal\contact\Entity\ContactForm;
use Drupal\Core\Form\FormStateInterface;

/**
 * Implements hook_form_FORM_ID_alter() for install_configure_form().
 *
 * Allows the profile to alter the site configuration form.
 */
function thejibeprofilestarterkit_form_install_configure_form_alter(&$form, FormStateInterface $form_state) {
  // Pre-populate the site name and email address.
  $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
  $form['site_information']['site_mail']['#default_value'] = 'admin@example.com';

  // Account information defaults
  $form['admin_account']['account']['name']['#default_value'] = 'admin';
  $form['admin_account']['account']['mail']['#default_value'] = 'admin@example.com';

  // Date/time settings
  $form['regional_settings']['site_default_country']['#default_value'] = 'CA';
  $form['regional_settings']['date_default_timezone']['#default_value'] = 'America/Vancouver';

  $form['#submit'][] = 'thejibe_form_install_configure_submit';
}

/**
 * Submission handler to sync the contact.form.feedback recipient.
 */
function thejibeprofilestarterkit_form_install_configure_submit($form, FormStateInterface $form_state) {
  $site_mail = $form_state->getValue('site_mail');
  ContactForm::load('feedback')->setRecipients([$site_mail])->trustData()->save();
}
