<?php


class Arguments extends CI_Model
{

    public function get($module = null, $name = null)
    {
        if ($module === null or $name === null) return false;

        $value = $this->db
            ->from('module_arguments')
            ->where('module', $module)
            ->where('name', $name)
            ->where('language', $this->language)
            ->get()
            ->row();

        return $value->value;
    }


}