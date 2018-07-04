SELECT
  XMLQUERY('for $i in /department
            where $i/city = "Toronto"
            return ($i/name, $i/city)'
            PASSING XMLDATA RETURNING CONTENT)
FROM dept_xml;