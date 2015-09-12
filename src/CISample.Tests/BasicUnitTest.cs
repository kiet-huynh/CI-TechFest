namespace CISample.Tests
{
    using NUnit.Framework;

    [TestFixture]
    public class BasicUnitTest
    {
        [Test]
        public void Should_Be_Equal()
        {
            Assert.AreEqual(1m, 1m);
        }

        [Test]
        public void Should_Be_True()
        {
            Assert.IsTrue(true);
        }

        //[Test]
        //public void Should_Fail_Test()
        //{
        //    Assert.IsTrue(false);
        //}
    }
}
