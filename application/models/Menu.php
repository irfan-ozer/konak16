<?php


class Menu extends  CI_Model
{
    private $menus = array();


    public function __construct()
    {
        $results = $this->db
            ->from('menus')
            ->where('parentId IS NULL')
            ->where('language', $this->language)
            ->get()
            ->result();

        foreach ($results as $result) {
            $this->menus[$result->name] = $this->childs($result->id);
        }

    }



    private function childs($parentId)
    {
        $results = $this->db
            ->from('menus')
            ->where('parentId', $parentId)
            ->where('language', $this->language)
            ->order_by('order', 'asc')
            ->order_by('id', 'asc')
            ->get()
            ->result();

        foreach ($results as $result) {
            $result->childs = $this->childs($result->id);
        }

        return $results;
    }


    public function get($name)
    {
        if (isset($this->menus[$name])) {
            return $this->menus[$name];
        }
    }


}