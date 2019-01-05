<?php


class Content extends  CI_Model
{

    public function findId($id)
    {
        $result = $this->db
            ->from('contents')
            ->where('id', $id)
            ->where('language', $this->language)
            ->get()
            ->row();

        if ($result) {
            $result->childs = $this->childs($result);
            $result->parent = $this->parent($result);
        }

        return $result;
    }


    public function parent($content)
    {
        if ($content->parentId > 0) {
            $result = $this->db
                ->from('contents')
                ->where('id', $content->parentId)
                ->where('language', $this->language)
                ->get()
                ->row();

            if ($result) {
                $result->childs = $this->childs($result);
            }

            return $result;
        }

        return false;
    }

    public function childs($content)
    {
        return $this->db
            ->from('contents')
            ->where('parentId', $content->id)
            ->where('language', $this->language)
            ->get()
            ->result();
    }

    public function reserved($key = null)
    {
        if ($key === null) return false;

        return $this->db
            ->from('contents')
            ->where('reserved', $key)
            ->where('language', $this->language)
            ->get()
            ->row();
    }




}