using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Xsl;

namespace xmlcomment2html
{
    class Program
    {
        static void Main(string[] args)
        {
            var input = args[0];
            var output = args[1];
            var xslpath = "xmlcomment2html.xslt";

            var xslt = new XslCompiledTransform();
            xslt.Load(xslpath);

            var setting = new XmlWriterSettings();
            setting.Indent = true;
            setting.OmitXmlDeclaration = false;

            using(var wr = XmlWriter.Create(output, setting))
            {
                xslt.Transform(input, wr);
            }
        }
    }
}
